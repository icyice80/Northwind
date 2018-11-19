<template>
  <div class="products">
    <h1>This Page lists all the products.</h1>
    <ProductList></ProductList>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

import ProductList from "../components/ProductList.vue";

@Component({ components: { ProductList } })
export default class Products extends Vue {}
</script>