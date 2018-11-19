<template>
  <div class="product-list">
    <div v-for="prod in products" :key="prod.productId">
      <ProductListItem :product=prod></ProductListItem>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import axios from "axios";

import ProductListItem from "./ProductListItem.vue";
import ProductBasic from "../models/productbasic";
import { productService } from "../services/product.service";

@Component({
  components: { ProductListItem }
})
export default class ProductList extends Vue {
  private products: ProductBasic[] = [];

  created() {
    productService.getProducts().then(resp => {
      this.products = resp.data.products;
    });
  }
}
</script>

