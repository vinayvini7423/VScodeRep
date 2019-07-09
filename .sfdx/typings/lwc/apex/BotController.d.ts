declare module "@salesforce/apex/BotController.upload" {
  export default function upload(param: {fileName: any, content: any}): Promise<any>;
}
declare module "@salesforce/apex/BotController.submit" {
  export default function submit(param: {utterance: any, session: any}): Promise<any>;
}
