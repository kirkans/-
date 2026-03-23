<template>
  <div>
    <div class="card" style="padding: 20px; line-height: 1.6;">
      <h2 style="color: #409EFF; margin-bottom: 15px;">
        您好，{{ user?.name }}！欢迎使用本在线医疗预约系统。
      </h2>
      <p style="font-size: 14px; color: #666; margin-bottom: 10px;">
        为了保障您的就医效率，请根据以下症状导诊指引选择对应科室挂号：
      </p>
      <ul style="font-size: 14px; color: #333; list-style-type: none; padding: 0;">
        <li style="margin-bottom: 8px;"><b>内科：</b> 感冒发烧、胃痛腹泻、呼吸道感染或不明原因疼痛。</li>
        <li style="margin-bottom: 8px;"><b>心脑血管：</b> 高血压、心悸、胸闷、头晕或肢体麻木。</li>
        <li style="margin-bottom: 8px;"><b>五官科：</b> 视力模糊、耳鸣听力下降、咽喉肿痛或口腔溃疡。</li>
        <li style="margin-bottom: 8px;"><b>妇科：</b> 妇科常规检查、月经不调或孕产相关咨询。</li>
        <li style="margin-bottom: 8px;"><b>儿科：</b> 针对 14 周岁以下儿童的所有身体不适。</li>
        <li style="margin-bottom: 8px;"><b>肿瘤科：</b> 术后复查、防癌筛查或相关病变咨询。</li>
      </ul>
      <p style="margin-top: 15px; font-weight: bold; color: #E6A23C;">
        温馨提示：急危重症请直接前往线下医院急诊部就诊。
      </p>
    </div>

    <div style="display: flex; margin: 10px 0">
      <div style="width: 50%;" class="card">
        <div style="margin-bottom: 30px; font-size: 20px; font-weight: bold">公告列表</div>
        <div >
          <el-timeline  reverse slot="reference">
            <el-timeline-item v-for="item in notices" :key="item.id" :timestamp="item.time">
              <el-popover
                  placement="right"
                  width="200"
                  trigger="hover"
                  :content="item.content">
                <span slot="reference">{{ item.title }}</span>
              </el-popover>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Home',
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      notices: []
    }
  },
  created() {
    this.$request.get('/notice/selectAll').then(res => {
      this.notices = res.data || []
    })
  }
}
</script>
