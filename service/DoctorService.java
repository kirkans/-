package com.example.service;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.exception.CustomException;
import com.example.mapper.DepartmentMapper;
import com.example.mapper.DoctorMapper;
import com.example.mapper.PlanMapper;
import com.example.mapper.ReserveMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class DoctorService {

    @Resource
    private DoctorMapper doctorMapper;
    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private ReserveMapper reserveMapper;
    @Resource
    private PlanMapper planMapper;

    /**
     * 新增
     */
    public void add(Doctor doctor) {
        Doctor dbDoctor = doctorMapper.selectByUsername(doctor.getUsername());
        if (ObjectUtil.isNotNull(dbDoctor)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(doctor.getPassword())) {
            doctor.setPassword(Constants.USER_DEFAULT_PASSWORD);
        }
        if (ObjectUtil.isEmpty(doctor.getName())) {
            doctor.setName(doctor.getUsername());
        }
        doctor.setRole(RoleEnum.DOCTOR.name());
        doctorMapper.insert(doctor);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        doctorMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            doctorMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Doctor doctor) {
        doctorMapper.updateById(doctor);
    }

    /**
     * 根据ID查询
     */
    public Doctor selectById(Integer id) {
        return doctorMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Doctor> selectAll(Doctor doctor) {
        return doctorMapper.selectAll(doctor);
    }

    /**
     * 分页查询
     */
    public PageInfo<Doctor> selectPage(Doctor doctor, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Doctor> list = doctorMapper.selectAll(doctor);
        return PageInfo.of(list);
    }
    /**
     * 用户登录
     */
    public Account login(Account account) {
        Doctor dbUser = doctorMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbUser.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbUser.getId() + "-" + RoleEnum.DOCTOR.name();
        String token = TokenUtils.createToken(tokenData, dbUser.getPassword());
        dbUser.setToken(token);
        if (ObjectUtil.isNotEmpty(dbUser.getDepartmentId())){
            Department department = departmentMapper.selectById(dbUser.getDepartmentId());
            if (ObjectUtil.isNotEmpty(department)){
                dbUser.setDepartmentName(department.getName());
            }
        }
        return dbUser;
    }
    /**
     * 用户注册
     */
    public void register(Account account) {
        Doctor doctor = new Doctor();
        BeanUtils.copyProperties(account, doctor);  // 拷贝 账号和密码2个属性
        this.add(doctor);  // 添加账户信息
    }

    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        Doctor dbUser = doctorMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbUser.getPassword())) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        dbUser.setPassword(account.getNewPassword());
        doctorMapper.updateById(dbUser);
    }

    public PageInfo<Doctor> selectPage2(Doctor doctor, Integer pageNum, Integer pageSize, String date) {
        if (ObjectUtil.isEmpty(date)) {
            date = DateUtil.format(new Date(), "yyyy-MM-dd");
        }
        // 查询在诊医生的时候，除了根据科室，还得根据当天是星期几，筛选出当天在诊的医生
        String week = getWeekByDate(date);
        doctor.setWeek(week);
        PageHelper.startPage(pageNum, pageSize);
        List<Doctor> list = doctorMapper.selectAll(doctor);
        // 计算查出来的在诊医生剩余多少个号
        for (Doctor dbDoctor : list) {
            // 查询出来当天已经挂过该医生号的数量
            Reserve reserve = new Reserve();
            reserve.setDoctorId(dbDoctor.getId());
            reserve.setTime(date);
            List<Reserve> reserves = reserveMapper.selectAll(reserve);
            Plan plan = planMapper.selectByDoctorIdAndWeek(dbDoctor.getId(), week);
            // 用总数量-已经挂过的号数量 = 剩余挂号数量
            if (plan != null) {
                dbDoctor.setNum(plan.getNum() - reserves.size());
            }
        }
        return PageInfo.of(list);
    }

    private String getWeekByDate(String dateStr) {
        try {
            // 使用 Hutool 的 DateUtil.parse，它能自动识别 yyyy-MM-dd, yyyy/MM/dd, ISO 等各种格式
            DateTime dateTime = DateUtil.parse(dateStr);
            // 明确转换为中文星期，例如 "星期一"
            return DateUtil.dayOfWeekEnum(dateTime).toChinese("星期");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }


}