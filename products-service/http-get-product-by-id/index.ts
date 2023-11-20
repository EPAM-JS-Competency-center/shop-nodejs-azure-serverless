import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {HttpGetProductByIdHandler} from "../src/modules/products/handlers/http-get-product-by-id";

const httpTrigger: AzureFunction = makeHandler(HttpGetProductByIdHandler)
export default httpTrigger;
