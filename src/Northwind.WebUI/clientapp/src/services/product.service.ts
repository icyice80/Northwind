import axios from 'axios';

import ProductBasic from '../models/productbasic';

const api = 'http://localhost:5000/api';

class ProductService {

  getProducts() {
    return axios.get( `${api}/products/getall`);
  }
}

// Export a singleton instance in the global namespace
export const productService = new ProductService();