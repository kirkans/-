<template>
  <div>
    <div class="search">
      <el-select v-model="departmentId" placeholder="请选择科室" style="width: 200px">
        <el-option v-for="item in departmentData" :key="item.id" :label="item.name" :value="item.id">
        </el-option>
      </el-select>
      <el-date-picker
          v-model="searchDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择日期"
          style="width: 200px; margin-left: 10px"
          :picker-options="pickerOptions"
          @change="load(1)">
      </el-date-picker>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
    </div>

    <div class="table" style="padding: 15px 20px" v-loading="loading">
      <el-row :gutter="20">
        <el-col :span="6" v-for="item in tableData" style="margin-bottom: 20px">
          <div style="text-align: center;position: relative; background-color: #ecf8fd" class="card" >
            <img :src="item.avatar" alt="" style="width: 100px; height: 100px; border-radius: 50%">
            <div style="font-weight: 550; margin-top: 10px">
              {{item.name}} <span style="color: #383535; margin-left: 5px; font-weight: 500">{{item.departmentName}}</span>
            </div>
            <div style="margin-top: 20px; color: #353523; padding: 0 10px; text-align: left; overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;">
              简介：{{item.description}}
            </div>
            <div style="margin-top: 15px">
              挂号费：<span style="color: red; font-weight: 550; margin-right: 20px">￥{{item.price}}</span> 剩余：{{item.num}}
            </div>
            <div style="position:absolute;bottom: 15px;margin-left: 100px">
              <el-button type="primary"  size="mini" @click="reserve(item.id,item.name)" :disabled="item.num===0">挂号</el-button>
            </div>
          </div>
        </el-col>
      </el-row>

      <div class="pagination">
        <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 20]"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Doctor",
  data() {
    return {
      tableData: [],  // 所有的数据
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
      departmentId: null,
      searchDate: new Date().toISOString().slice(0, 10),
      fromVisible: false,
      form: {},
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      rules: {},
      ids: [],
      departmentData: [],
      userName:"",
      loading: false,
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7 || time.getTime() > Date.now() + 6 * 8.64e7;
        }
      }
    }
  },
  created() {
    this.load(1)
    this.loadDepartment()
  },
  methods: {
    reserve(doctorId,doctorName) {
      if(this.user.role!=='USER'){
        this.$message.warning("您不支持挂号操作")
        return
      }
      let data = {
        userId: this.user.id,
        doctorId: doctorId,
        doctorName:doctorName,
        userName:this.user.username,
        time: this.searchDate
      }
      this.$request.post('/reserve/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('挂号成功')
          this.load(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadDepartment() {
      this.$request.get('/department/selectAll').then(res => {
        if (res.code === '200') {
          this.departmentData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    load(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.loading = true

      // --- 新增逻辑：将日期转为星期 ---
      const weeks = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
      let weekName = weeks[new Date(this.searchDate).getDay()];
      // ---------------------------

      this.$request.get('/doctor/selectPage2', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          departmentId: this.departmentId,
          week: weekName,   // 关键：直接传“星期几”给后端
          date: this.searchDate
        }
      }).then(res => {
        this.loading = false
        if (res.code === '200') {
          this.tableData = res.data?.list
          this.total = res.data?.total
          // 只有当是用户手动触发（非初始化）时才提示，避免页面刚打开就弹窗
          if (this.pageNum === 1 && pageNum === 1) {
             // 这里可以加个判断，如果是created调用的就不弹，但为了简单先不加，或者你可以观察下效果
          }
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.loading = false
        this.$message.error('请求失败，请检查网络或联系管理员')
      })
    },
    reset() {
      this.departmentId = null
      this.searchDate = new Date().toISOString().slice(0, 10)
      this.load(1)
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum)
    },
  }
}
</script>

<style scoped>

</style>