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
@ApiModel(value="任务的相关信息", description="")
@TableName("task")
public class Task {
    @ApiModelProperty("任务id")
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("老人id")
    @TableField("elder_id")
    private Integer elderId;

    @ApiModelProperty("任务开始时间")
    @TableField("start_time")
    private LocalDate startTime;

    @ApiModelProperty("任务结束时间")
    @TableField("end_time")
    private LocalDate endTime;

    @ApiModelProperty("任务当前状态标识的ID")
    @TableField("state_id")
    private Integer stateId;

    @ApiModelProperty("任务当前状态标识")
    @TableField(exist = false)
    private TaskState curState;

    @ApiModelProperty("任务等级")
    @TableField("grade_id")
    private Integer gradeId;

    @ApiModelProperty("搜救队员一号")
    @TableField("member1_id")
    private Integer memberId1;

    @ApiModelProperty("搜救队员二号")
    @TableField("member2_id")
    private Integer memberId2;

    @ApiModelProperty("搜救队员三号")
    @TableField("member3_id")
    private Integer memberId3;

    @ApiModelProperty("搜救队员四号")
    @TableField("member4_id")
    private Integer memberId4;

    @ApiModelProperty("线索")
    @TableField("clue")
    private String clue;
}
