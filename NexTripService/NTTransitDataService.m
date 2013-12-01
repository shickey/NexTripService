//
//  NTTransitDataService.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTTransitDataService.h"
#import "AFNetworking.h"

@interface NTTransitDataService ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

- (NSURL *)baseURL;

@end

@implementation NTTransitDataService

- (id)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self baseURL]];
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        NSSet *contentTypes = serializer.acceptableContentTypes;
        contentTypes = [contentTypes setByAddingObject:@"text/plain"];
        serializer.acceptableContentTypes = contentTypes;
        _manager.responseSerializer = serializer;
    }
    return self;
}

- (void)queryStopsInRectangleXMin:(double)xMin
                             xMax:(double)xMax
                             yMin:(double)yMin
                             yMax:(double)yMax
                   withCompletion:(void(^)(NSArray *stops, NSError *error))completion
{
    NSString *endpoint = @"17/query/";
    NSString *geometryJSONString = [NSString stringWithFormat:@"{\"xmin\":%f,\"xmax\":%f,\"ymin\":%f,\"ymax\":%f}", xMin, xMax, yMin, yMax];
    NSDictionary *params = @{@"f"             : @"pjson",
                             @"where"         : @"busstop_yn = 'Y'",
                             @"outFields"     : @"*",
                             @"returnGeometry": @"true",
                             @"inSR"          : @"{\"wkid\":4236}", // 4236 is WGS84 Ellipsoid (i.e., std lat/long coords)
                             @"geometryType"  : @"esriGeometryEnvelope",
                             @"geometry"      : geometryJSONString,
                             @"outSR"         : @"{\"wkid\":4236}"};
    [self.manager GET:endpoint parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = (NSDictionary *)responseObject;
        if (completion) {
            completion(json[@"features"], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

#pragma mark - Private Methods

- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"http://gis2.metc.state.mn.us/arcgis/rest/services/MetroGIS/Transportation/MapServer/"];
}

@end
