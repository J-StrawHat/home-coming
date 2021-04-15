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

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value="已报备的救援人员的信息", description="")
@TableName("repo_person")
public class RepoPerson {
    @ApiModelProperty("救援人员id")
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("外码，参照user表中的id")
    @TableField("uid")
    private Integer uid;

    @ApiModelProperty("外码，参照transport表中的id，表示交通方式")
    @TableField("trans_type")
    private Integer transType;

    @ApiModelProperty("是否准备充分")
    @TableField("IsPrepare")
    private Boolean isPrepared;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String preparedRemark;
}
