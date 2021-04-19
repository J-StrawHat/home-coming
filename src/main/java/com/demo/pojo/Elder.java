package com.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "老人信息", description = "")
@TableName("elder_info")
public class Elder {
    @ApiModelProperty("老人id")
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("老人名")
    @TableField("name")
    private String elderName;

    @ApiModelProperty("年龄")
    @TableField("age")
    private Integer age;

    @ApiModelProperty("性别")
    @TableField("gender")
    private String gender;

    @ApiModelProperty("民族")
    @TableField("nation")
    private String nation;

    @ApiModelProperty("籍贯")
    @TableField("native")
    private String eldernative;

    @ApiModelProperty("出生日期")
    @TableField("birthday")
    private LocalDate birthday;

    @ApiModelProperty("特征")
    @TableField("feature")
    private String feature;

    @ApiModelProperty("走失时身高")
    @TableField("miss_height")
    private Double missHeight;

    @ApiModelProperty("走失时体重")
    @TableField("miss_weight")
    private Double missWeight;

    @ApiModelProperty("失踪省份")
    @TableField("miss_province")
    private String missProvince;

    @ApiModelProperty("失踪城市")
    @TableField("miss_city")
        private String missCity;

    @ApiModelProperty("失踪区/县")
    @TableField("miss_county")
    private String missCounty;

    @ApiModelProperty("失踪街道/镇")
    @TableField("miss_town")
        private String missTown;

    @ApiModelProperty("失踪地详细说明")
    @TableField("miss_desc")
    private String missDesc;

    @ApiModelProperty("失踪时间")
    @TableField("miss_time")
    private LocalDate missTime;

    @ApiModelProperty("失踪类型ID")
    @TableField("miss_type")
    private Integer missTypeId;




    @ApiModelProperty("联系人")
    @TableField("contactor")
    private String contactor;

    @ApiModelProperty("联系电话")
    @TableField("contact_tel")
    private String contactTel;

    @ApiModelProperty("身体状况")
    @TableField("physical_condition")
    private String physicalCondition;

    @ApiModelProperty("心理状况")
    @TableField("psyc_condition")
    private String psycCondition;

    @ApiModelProperty("身份证号")
    @TableField("ID_num")
    private String IDnum;

    @ApiModelProperty("照片地址")
    @TableField("photo")
    private String photo;

    @ApiModelProperty("可能去往地省份")
    @TableField("pos_pla_province")
    private String posPlaProvince;

    @ApiModelProperty("可能去往地市")
    @TableField("pos_pla_city")
    private String posPlaCity;

    @ApiModelProperty("可能去往地区/县")
    @TableField("pos_pla_county")
    private String posPlaCounty;

    @ApiModelProperty("可能去往地街道/镇")
    @TableField("pos_pla_town")
    private String posPlaTown;

    @ApiModelProperty("可能去往地详细说明")
    @TableField("pos_pla_desc")
    private String posPlaDesc;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("失踪类")
    @TableField(exist = false)
    private MissingType missingType;

}
