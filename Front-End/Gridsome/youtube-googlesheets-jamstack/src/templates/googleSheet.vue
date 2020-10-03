<template>
     <Layout>
          <div>
               <h3>Test Route</h3>
               <div>{{$page.googleSheet.Name}}</div>
          </div>
     </Layout>
</template>

<page-query>
     query Sheet($path: String!) {
          googleSheet(path: $path) {
               Name
          }
     }
</page-query>

<script>
export default {

}
</script>
