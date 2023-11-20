import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {
    HttpGetImportProductsFiles
} from "../src/modules/products/handlers/http-get-import-products-files";

const httpTrigger: AzureFunction = makeHandler(HttpGetImportProductsFiles)
export default httpTrigger;
