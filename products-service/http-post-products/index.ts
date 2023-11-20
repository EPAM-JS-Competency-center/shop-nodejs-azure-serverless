import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {HttpPostProductsHandler} from "../src/modules/products/handlers/http-post-products.handler";

const httpTrigger: AzureFunction = makeHandler(HttpPostProductsHandler)
export default httpTrigger;
