import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {HttpGetProductsListHandler} from "../src/modules/products/handlers/http-get-products-list.handler";

const httpTrigger: AzureFunction = makeHandler(HttpGetProductsListHandler)
export default httpTrigger;
