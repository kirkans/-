<template>
  <div>
    <div style="height: 100vh; overflow: hidden; display: flex; align-items: center; justify-content: center">
      <div style="font-size: 40px">404 找不到页面
        <a v-if="user.role==='USER'" href="#" @click="navTo('/front/home')">返回首页</a>
        <a v-else  href="#" @click="navTo('/home')">返回首页</a>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "404",
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
    }
  },
  created() {

  },
  methods: {
    navTo(url) {
      location.href = url
    },
  }
}
</script>

<style scoped>
a{
  color: blue;
}
a:hover{
  color: red;
}
</style>