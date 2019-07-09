declare module "@salesforce/apex/FulfillmentPlanControler.fulfillmentData" {
  export default function fulfillmentData(param: {oppId: any}): Promise<any>;
}
declare module "@salesforce/apex/FulfillmentPlanControler.getPickListValuesIntoList" {
  export default function getPickListValuesIntoList(): Promise<any>;
}
declare module "@salesforce/apex/FulfillmentPlanControler.getPickListValueofLocation" {
  export default function getPickListValueofLocation(): Promise<any>;
}
declare module "@salesforce/apex/FulfillmentPlanControler.createFulfillment" {
  export default function createFulfillment(param: {practices: any, region: any, Numofemp: any, skillsNeed: any}): Promise<any>;
}
declare module "@salesforce/apex/FulfillmentPlanControler.deleteFulfillment" {
  export default function deleteFulfillment(param: {fulfillmentId: any}): Promise<any>;
}
declare module "@salesforce/apex/FulfillmentPlanControler.saveDetails" {
  export default function saveDetails(param: {dataList: any}): Promise<any>;
}
