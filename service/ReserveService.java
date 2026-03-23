package com.example.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.common.enums.CallEnum;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Doctor;
import com.example.entity.Reserve;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.example.mapper.DoctorMapper;
import com.example.mapper.ReserveMapper;
import com.example.mapper.UserMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ReserveService {

    @Resource
    private ReserveMapper reserveMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private DoctorMapper doctorMapper;
    /**
     * 新增
     */
    public void add(Reserve reserve) {
        //判断该用户当天有没有对该医生挂过号
        List<Reserve> reserves = reserveMapper.selectAll(reserve);
        if(CollectionUtil.isNotEmpty(reserves)){
            throw new CustomException(ResultCodeEnum.RESERVE_IS_EXITS);
        }
        if (ObjectUtil.isEmpty(reserve.getTime())) {
            reserve.setTime(DateUtil.format(new Date(), "yyyy-MM-dd"));
        }
        //判断余额是否足够
        User user = userMapper.selectById(reserve.getUserId());
        Doctor doctor = doctorMapper.selectById(reserve.getDoctorId());
        if(user.getAccount()<doctor.getPrice()){
            throw new CustomException(ResultCodeEnum.RESERVE_ACCOUNT_NOT);
        }
        reserve.setStatus(CallEnum.STATUS_NO.status);
        reserveMapper.insert(reserve);
        //扣除余额
        user.setAccount(user.getAccount()-doctor.getPrice());
        userMapper.updateById(user);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        //取消挂号返回余额
        Reserve reserve = reserveMapper.selectById(id);
        User user = userMapper.selectById(reserve.getUserId());
        Doctor doctor = doctorMapper.selectById(reserve.getDoctorId());
        user.setAccount(user.getAccount()+doctor.getPrice());
        userMapper.updateById(user);
        reserveMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            reserveMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Reserve reserve) {
        reserveMapper.updateById(reserve);
    }

    /**
     * 根据ID查询
     */
    public Reserve selectById(Integer id) {
        return reserveMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Reserve> selectAll(Reserve reserve) {
        return reserveMapper.selectAll(reserve);
    }

    /**
     * 分页查询
     */
    public PageInfo<Reserve> selectPage(Reserve reserve, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            reserve.setUserId(currentUser.getId());
        }else if (RoleEnum.DOCTOR.name().equals(currentUser.getRole())) {
            reserve.setDoctorId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Reserve> list = reserveMapper.selectAll(reserve);
        return PageInfo.of(list);
    }

}