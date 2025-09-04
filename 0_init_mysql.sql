use rjgx_access;

create table equipment_code
(
    id                      varchar(32)  not null comment 'id (uuid)' primary key,
    creator                 varchar(32)  null comment '创建人 create_people',
    create_time             datetime     null comment '创建时间 create_time',
    modifier                varchar(32)  null comment '更新人 update_people',
    modification_time       datetime     null comment '更新时间 update_time',
    old_id                  int          null comment '125id old_id',
    plane_old_id            int          null comment '装备型号id plane_old_id',
    c_coat                  varchar(45)  null comment '涂装号 c_coat',
    c_interior              varchar(45)  null comment '内部编号 c_interior',
    c_manufacturing         varchar(45)  null comment '出厂编号 c_manufacturing',
    icd_version             varchar(255) null comment 'icd版本 icd_version',
    avionics_system_version varchar(255) null comment '航电版本 arionics_system_version',
    is_used                 tinyint      null comment '是否被启用，1启用，2未启用 is_used',
    is_deleted              tinyint      null comment '删除标记位，1正常，2删除 is_deleted',
    used_time               datetime     null comment '启用时间 used_time',
    icd_version_id          varchar(32)  null comment 'icd版本 (uuid) icd_version_id',
    is_self_build           tinyint default 0 comment '是否自建 默认0 0引入 1自建'
) COMMENT '装备代码表';

create table equipment_info
(
    id                     varchar(255) not null comment 'id (uuid)' primary key,
    create_time            datetime     null comment '创建时间',
    modification_time      datetime     null comment '更新时间 update_time',
    creator                varchar(255) null comment '创建人 create_people',
    modifier               varchar(255) null comment '更新人 update_people',
    old_id                 varchar(255) null comment '125id',
    plane_type             varchar(255) null comment '装备名称 plane_type',
    equipment_type         varchar(255) null comment '装备分类 equipment_type',
    plane_weight           double       null comment '装备重量 plane_weight',
    parent_id              varchar(255) null comment '分类的id(关联字典表) parent_id',
    system_3d              tinyint      null comment '1：三型机；2：体系；3：小体系；4：ACMI threetype_system',
    is_deleted             tinyint      null comment '是否删除，1：删除；2：未删除 is_deleted',
    equipment_model        varchar(255) null comment '装备型号 equipment_model',
    unit                   varchar(255) null comment '单位 unit',
    working_frequency_band varchar(255) null comment '工作波段 work_band',
    longitude              double       null comment '经度 longitude',
    latitude               double       null comment '维度 latitude',
    is_3d_playback         tinyint      null comment '能否支持三维回放，1：能；2：不能 is_three_back',
    is_self_build          tinyint default 0 comment '是否自建 默认0 0引入 1自建'
) COMMENT '装备信息表';

create table flight_plan_flight_cmd
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    name      varchar(255) null comment '姓名',
    lb        varchar(255) null comment '类别',
    sx        varchar(255) null comment '属性'
) COMMENT '飞行计划 XML中的CMD段';

create table flight_plan_dynamic_flight_cmd
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    name      varchar(255) null comment '姓名',
    lb        varchar(255) null comment '类别',
    sx        varchar(255) null comment '属性'
) COMMENT '飞行计划动态 XML中的CMD段';

create table flight_plan_implementation_flight_cmd
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    name      varchar(255) null comment '姓名',
    lb        varchar(255) null comment '类别',
    sx        varchar(255) null comment '属性'
) COMMENT '飞行计划实施 XML中的CMD段';

create table flight_plan_flight_head
(
    import_id     bigint       not null comment '导入ID',
    root_id       varchar(255) null comment '根ID',
    id            bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    ver           varchar(255) null comment '版本',
    title         varchar(255) null comment '标题',
    timeline      varchar(255) null comment '时间线',
    t_mode        varchar(255) null comment '模式',
    plane_num     int          null comment '计划数量',
    flights_time  int          null comment '开飞时刻',
    total_time    int          null comment '总场时间',
    exit_time     int          null comment '退离时刻',
    sun_rise_time varchar(255) null comment '日出时刻',
    sun_set_time  varchar(255) null comment '日落时刻',
    dark_time     varchar(255) null comment '天黑时刻',
    dawn_time     varchar(255) null comment '天亮时刻',
    dxthh         varchar(255) null comment '大小天亮时刻',
    zhshh         varchar(255) null comment '中午时刻',
    dwsbxh        varchar(255) null comment '低温设备型号'
) COMMENT '飞行计划 XML中的HEAD标签段';

create table flight_plan_dynamic_flight_head
(
    import_id     bigint       not null comment '导入ID',
    root_id       varchar(255) null comment '根ID',
    id            bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    ver           varchar(255) null comment '版本',
    title         varchar(255) null comment '标题',
    timeline      varchar(255) null comment '时间线',
    t_mode        varchar(255) null comment '模式',
    plane_num     int          null comment '计划数量',
    flights_time  int          null comment '开飞时刻',
    total_time    int          null comment '总场时间',
    exit_time     int          null comment '退离时刻',
    sun_rise_time varchar(255) null comment '日出时刻',
    sun_set_time  varchar(255) null comment '日落时刻',
    dark_time     varchar(255) null comment '天黑时刻',
    dawn_time     varchar(255) null comment '天亮时刻',
    dxthh         varchar(255) null comment '大小天亮时刻',
    zhshh         varchar(255) null comment '中午时刻',
    dwsbxh        varchar(255) null comment '低温设备型号'
) COMMENT '飞行计划动态 XML中的HEAD标签段';

create table flight_plan_implementation_flight_head
(
    import_id     bigint       not null comment '导入ID',
    root_id       varchar(255) null comment '根ID',
    id            bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    ver           varchar(255) null comment '版本',
    title         varchar(255) null comment '标题',
    timeline      varchar(255) null comment '时间线',
    t_mode        varchar(255) null comment '模式',
    plane_num     int          null comment '计划数量',
    flights_time  int          null comment '开飞时刻',
    total_time    int          null comment '总场时间',
    exit_time     int          null comment '退离时刻',
    sun_rise_time varchar(255) null comment '日出时刻',
    sun_set_time  varchar(255) null comment '日落时刻',
    dark_time     varchar(255) null comment '天黑时刻',
    dawn_time     varchar(255) null comment '天亮时刻',
    dxthh         varchar(255) null comment '大小天亮时刻',
    zhshh         varchar(255) null comment '中午时刻',
    dwsbxh        varchar(255) null comment '低温设备型号'
) COMMENT '飞行计划实施 XML中的HEAD标签段';

create table flight_plan_flight_notes
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    note      varchar(255) null comment '备注'
) COMMENT '飞行计划 XML中的NOTE段';

create table flight_plan_dynamic_flight_notes
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    note      varchar(255) null comment '备注'
) COMMENT '飞行计划动态 XML中的NOTE段';

create table flight_plan_implementation_flight_notes
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    note      varchar(255) null comment '备注'
) COMMENT '飞行计划实施 XML中的NOTE段';

create table flight_plan_flight_plan
(
    import_id           bigint       not null comment '导入ID',
    root_id             varchar(255) null comment '根ID',
    id                  bigint auto_increment comment '主键,自增ID'
        primary key,
    sortie_number       varchar(255) null comment '架次编号',
    airport_id          varchar(255) null comment '机场ID JCID',
    takeoff_time        varchar(255) null comment '起飞时间 HH:mm QFSK',
    air_battle_time     varchar(255) null comment '空战时间 KZSK',
    ys                  varchar(255) null comment 'YS',
    plane_model         varchar(255) null comment '机型 DG',
    practice_number     varchar(255) null comment '练习号 LXH',
    cs                  varchar(255) null comment 'CS',
    sj                  varchar(255) null comment '时间 SJ',
    jhlx                varchar(255) null comment 'JHLX',
    plan_time           varchar(255) null comment '计划时间 JHSJ',
    height              varchar(255) null comment '高度 GD',
    ky                  varchar(255) null comment 'KY',
    fz                  varchar(255) null comment 'FZ',
    formation_number    varchar(255) null comment '编队编号 BDNO',
    is_leader_plane     varchar(255) null comment '是否长机 SFZJ',
    formation_practice  varchar(255) null comment '编队练习 BDLX',
    number_of_formation varchar(255) null comment '编队数量 BDSL',
    front_name          varchar(255) null comment '前舱姓名 QCXM',
    front_code          varchar(255) null comment '前舱代码 QCDM',
    front_code_name     varchar(255) null comment '前舱代号 QCDH',
    front_nick_name     varchar(255) null comment '前舱代字 QCDZ',
    front_property      varchar(255) null comment '前舱性质 QCXZ',
    back_name           varchar(255) null comment '后舱姓名 HCXM',
    back_code           varchar(255) null comment '后舱代码 HCDM',
    back_code_name      varchar(255) null comment '后舱代号 HCDH',
    back_nick_name      varchar(255) null comment '后舱代字 HCDZ',
    back_property       varchar(255) null comment '后舱性质 HCXZ',
    xsms                varchar(255) null comment 'XSMS',
    jkys                varchar(255) null comment 'JKYS',
    yxyl                varchar(255) null comment 'YXYL',
    wqgz                varchar(255) null comment 'WQGZ',
    grfa                varchar(255) null comment 'GRFA'
) COMMENT '飞行计划 XML中的计划内容段';

create table flight_plan_dynamic_flight_plan
(
    import_id           bigint       not null comment '导入ID',
    root_id             varchar(255) null comment '根ID',
    id                  bigint auto_increment comment '主键,自增ID'
        primary key,
    sortie_number       varchar(255) null comment '架次编号',
    airport_id          varchar(255) null comment '机场ID JCID',
    takeoff_time        varchar(255) null comment '起飞时间 HH:mm QFSK',
    air_battle_time     varchar(255) null comment '空战时间 KZSK',
    ys                  varchar(255) null comment 'YS',
    plane_model         varchar(255) null comment '机型 DG',
    practice_number     varchar(255) null comment '练习号 LXH',
    cs                  varchar(255) null comment 'CS',
    sj                  varchar(255) null comment '时间 SJ',
    jhlx                varchar(255) null comment 'JHLX',
    plan_time           varchar(255) null comment '计划时间 JHSJ',
    height              varchar(255) null comment '高度 GD',
    ky                  varchar(255) null comment 'KY',
    fz                  varchar(255) null comment 'FZ',
    formation_number    varchar(255) null comment '编队编号 BDNO',
    is_leader_plane     varchar(255) null comment '是否长机 SFZJ',
    formation_practice  varchar(255) null comment '编队练习 BDLX',
    number_of_formation varchar(255) null comment '编队数量 BDSL',
    front_name          varchar(255) null comment '前舱姓名 QCXM',
    front_code          varchar(255) null comment '前舱代码 QCDM',
    front_code_name     varchar(255) null comment '前舱代号 QCDH',
    front_nick_name     varchar(255) null comment '前舱代字 QCDZ',
    front_property      varchar(255) null comment '前舱性质 QCXZ',
    back_name           varchar(255) null comment '后舱姓名 HCXM',
    back_code           varchar(255) null comment '后舱代码 HCDM',
    back_code_name      varchar(255) null comment '后舱代号 HCDH',
    back_nick_name      varchar(255) null comment '后舱代字 HCDZ',
    back_property       varchar(255) null comment '后舱性质 HCXZ',
    xsms                varchar(255) null comment 'XSMS',
    jkys                varchar(255) null comment 'JKYS',
    yxyl                varchar(255) null comment 'YXYL',
    wqgz                varchar(255) null comment 'WQGZ',
    grfa                varchar(255) null comment 'GRFA'
) COMMENT '飞行计划动态 XML中的计划内容段';

create table flight_plan_implementation_flight_plan
(
    import_id           bigint       not null comment '导入ID',
    root_id             varchar(255) null comment '根ID',
    id                  bigint auto_increment comment '主键,自增ID'
        primary key,
    sortie_number       varchar(255) null comment '架次编号',
    airport_id          varchar(255) null comment '机场ID JCID',
    takeoff_time        varchar(255) null comment '起飞时间 HH:mm QFSK',
    air_battle_time     varchar(255) null comment '空战时间 KZSK',
    ys                  varchar(255) null comment 'YS',
    plane_model         varchar(255) null comment '机型 DG',
    practice_number     varchar(255) null comment '练习号 LXH',
    cs                  varchar(255) null comment 'CS',
    sj                  varchar(255) null comment '时间 SJ',
    jhlx                varchar(255) null comment 'JHLX',
    plan_time           varchar(255) null comment '计划时间 JHSJ',
    height              varchar(255) null comment '高度 GD',
    ky                  varchar(255) null comment 'KY',
    fz                  varchar(255) null comment 'FZ',
    formation_number    varchar(255) null comment '编队编号 BDNO',
    is_leader_plane     varchar(255) null comment '是否长机 SFZJ',
    formation_practice  varchar(255) null comment '编队练习 BDLX',
    number_of_formation varchar(255) null comment '编队数量 BDSL',
    front_name          varchar(255) null comment '前舱姓名 QCXM',
    front_code          varchar(255) null comment '前舱代码 QCDM',
    front_code_name     varchar(255) null comment '前舱代号 QCDH',
    front_nick_name     varchar(255) null comment '前舱代字 QCDZ',
    front_property      varchar(255) null comment '前舱性质 QCXZ',
    back_name           varchar(255) null comment '后舱姓名 HCXM',
    back_code           varchar(255) null comment '后舱代码 HCDM',
    back_code_name      varchar(255) null comment '后舱代号 HCDH',
    back_nick_name      varchar(255) null comment '后舱代字 HCDZ',
    back_property       varchar(255) null comment '后舱性质 HCXZ',
    xsms                varchar(255) null comment 'XSMS',
    jkys                varchar(255) null comment 'JKYS',
    yxyl                varchar(255) null comment 'YXYL',
    wqgz                varchar(255) null comment 'WQGZ',
    grfa                varchar(255) null comment 'GRFA'
) COMMENT '飞行计划实施 XML中的计划内容段';

create table flight_plan_flight_plan_root
(
    import_id        bigint       not null comment '导入ID',
    id               varchar(255) not null comment '根ID'
        primary key,
    flight_date      date         null comment '飞行日期',
    flight_date_time datetime     null comment '飞行日期时间'
) COMMENT '飞行计划根节点表';

create table flight_plan_dynamic_flight_plan_root
(
    import_id        bigint       not null comment '导入ID',
    id               varchar(255) not null comment '根ID'
        primary key,
    flight_date      date         null comment '飞行日期',
    flight_date_time datetime     null comment '飞行日期时间'
) COMMENT '飞行计划动态根节点表';

create table flight_plan_implementation_flight_plan_root
(
    import_id        bigint       not null comment '导入ID',
    id               varchar(255) not null comment '根ID'
        primary key,
    flight_date      date         null comment '飞行日期',
    flight_date_time datetime     null comment '飞行日期时间'
) COMMENT '飞行计划实施根节点表';

create table flight_plan_flight_task
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    model     varchar(255) null comment '型号',
    code      varchar(255) null comment '代码',
    name      varchar(255) null comment '姓名',
    rw        varchar(255) null comment '任务'
) COMMENT '飞行计划 XML中的TASK段';

create table flight_plan_dynamic_flight_task
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    model     varchar(255) null comment '型号',
    code      varchar(255) null comment '代码',
    name      varchar(255) null comment '姓名',
    rw        varchar(255) null comment '任务'
) COMMENT '飞行计划动态 XML中的TASK段';

create table flight_plan_implementation_flight_task
(
    import_id bigint       not null comment '导入ID',
    root_id   varchar(255) null comment '根ID',
    id        bigint auto_increment comment '这个字段是咱自己的 主键 bigint auto increment,源库没有主键'
        primary key,
    model     varchar(255) null comment '型号',
    code      varchar(255) null comment '代码',
    name      varchar(255) null comment '姓名',
    rw        varchar(255) null comment '任务'
) COMMENT '飞行计划实施 XML中的TASK段';

create table pilot_info
(
    import_id                   bigint       not null comment '导入ID',
    personal_identifier         varchar(255) not null comment '个人标识 GRBS'
        primary key,
    unit_code                   varchar(255) null comment '单位代码 DWDM',
    unit                        varchar(255) null comment '单位 DW',
    name                        varchar(255) null comment '姓名 XM',
    position                    varchar(255) null comment '职务 ZW',
    sex                         varchar(10)  null comment '性别 XB',
    appointment_date            date         null comment '任职年月 RZNY',
    native_place                varchar(255) null comment '籍贯 JG',
    family_background           varchar(255) null comment '家庭出身 JTCS',
    education_level             varchar(255) null comment '文化程度 WHCD',
    birthday                    date         null comment '生日 SR',
    enlistment_date             date         null comment '入伍年月 RWNY',
    rating_date                 date         null comment '评级年月 PJNY',
    graduate_college            varchar(255) null comment '毕业学院 BYXY',
    graduation_date             date         null comment '毕业年月 BYNY',
    military_rank               varchar(255) null comment '军衔 JX',
    pilot_role                  varchar(255) null comment '正副驾驶 ZFJS',
    flight_level                varchar(255) null comment '飞行等级 FXDJ',
    current_aircraft_type       varchar(255) null comment '现飞机型 XFJX',
    pxh                         varchar(255) null comment 'PXH',
    code_name                   varchar(255) null comment '代号 DH',
    bm                          varchar(255) null comment 'BM',
    code_character              varchar(255) null comment '代字 DZ',
    is_air_combat_commander     varchar(255) null comment '是否空战指挥员 SFKZZHY',
    flight_outline              varchar(255) null comment '飞行提纲 FXTG',
    lead_pilot                  varchar(255) null comment '长机 ZJ',
    command_level_daytime       varchar(255) null comment '指挥水平（昼间） ZHSP_ZJ',
    command_level_nighttime     varchar(255) null comment '指挥水平（夜间） ZHSP_YJ',
    instructor                  varchar(255) null comment '教员 JY',
    theoretical_instructor      varchar(255) null comment '理论教员 LLJY',
    zbzt                        varchar(255) null comment 'ZBZT',
    is_trainee                  varchar(255) null comment '是否学员 SFXY',
    is_instructor               varchar(255) null comment '是否教官 SFJG',
    qb                          varchar(255) null comment 'QB',
    last_parachute_time_land    date         null comment '最后跳伞时间（陆） ZHTSSJ_L',
    last_parachute_time_water   date         null comment '最后跳伞时间（水） ZHTSSJ_S',
    modification_time           date         null comment '修改时间 XGSJ',
    total_time_history          varchar(255) null comment '历年总时间 LNZSJ HH:mm',
    total_time_current_year     varchar(255) null comment '本年总时间 BNZSJ HH:mm',
    total_teaching_time_history varchar(255) null comment '历年任教时间 LNRJSJ HH:mm'
) COMMENT '飞行员信息表';

create table sorties
(
    import_id         bigint       not null comment '导入ID',
    airplane_model    varchar(255) null comment '机型',
    airplane_number   varchar(255) null comment '机号',
    arm_type          varchar(255) null comment '武器类型',
    batch_number      varchar(255) null comment '批次',
    camp              bigint       null comment '阵营',
    camp_str          varchar(255) null comment '阵营说明',
    car_end_time      datetime     null comment '开关车结束时间',
    car_start_time    datetime     null comment '开关车开始时间',
    create_time       datetime     null comment '创建时间',
    down_pilot        varchar(255) null comment '后舱飞行员',
    folder_id         varchar(255) null comment '文件ID',
    folder_name       varchar(255) null comment '文件名称',
    icd_version       varchar(255) null comment 'ICD 版本',
    interpolation     bigint       null comment '插值精度',
    is_effective      bigint       null comment '架次是否有效',
    is_effective_name varchar(255) null comment '架次是否有效',
    location          varchar(255) null comment '任务地点',
    pilot             varchar(255) null comment '飞行员代字',
    qx_id             varchar(255) null comment '嵌训ID',
    remark            varchar(255) null comment '备注',
    role              bigint       null comment '角色',
    role_str          varchar(255) null comment '角色说明',
    sky_time          varchar(255) null comment '空中时间',
    sortie_id         varchar(255) not null comment '主键ID'
        primary key,
    sortie_number     varchar(255) not null comment '架次编号',
    source            bigint       null comment '来源',
    stealth           bigint       null comment '飞机隐身状态',
    stealth_str       varchar(255) null comment '飞机隐身状态说明',
    subject           varchar(255) null comment '科目',
    sync_system       bigint       null comment '敌我识别同步系统',
    sync_system_str   varchar(255) null comment '敌我识别同步系统说明',
    test_drive        bigint       null comment '试驾编号',
    test_drive_str    varchar(255) null comment '试驾编号说明',
    up_pilot          varchar(255) null comment '前舱飞行员',
    status            tinyint default 0 comment '是否在导入数据资产中被使用',
    constraint sortie_number
        unique (sortie_number)
) COMMENT '架次表';

create table sorties_batch
(
    import_id    bigint       not null comment '导入ID',
    id           varchar(255) not null comment '主键ID'
        primary key,
    batch_number varchar(255) null comment '批次号'
) COMMENT '批次表';

create table asset_summary
(
    import_id      bigint       not null comment '导入ID',
    id             bigint       not null comment '数据资产ID 对应着AssetTableModel的asset_id字段'
        primary key,
    name           varchar(255) null comment '数据资产名称',
    full_name      varchar(255) null comment '数据资产全名',
    model          varchar(255) null comment '数据资产模型',
    icd_id         int          null comment 'ICD ID',
    icd            varchar(255) null comment 'ICD',
    db_name        varchar(255) null comment '数据库名称',
    source         smallint     null comment '数据来源 来源（0-机载总线 1-ACMI 2-装备 3-数据库）',
    remark         text         null comment '备注',
    objectify_flag int          null comment '对象化标志',
    copy_flag      int          null comment '复制标志',
    labels         varchar(255) null comment '标签',
    time_frame     int          null comment '时间帧',
    time_type      int          null comment '时间类型'
) COMMENT '数据资产Summary 接口1响应';

create table asset_table_model
(
    import_id       bigint       not null comment '导入ID',
    id              bigint       not null comment 'id'
        primary key,
    asset_id        bigint       null comment '数据资产id',
    icd_id          bigint       null comment 'ICD版本号',
    name            varchar(255) null comment '模型名称',
    is_master       int          null comment '是否主表',
    repeat_interval int          null comment '重复间隔',
    repeat_times    int          null comment '重复次数'
) COMMENT '数据资产库表模型 接口2主响应';

create table asset_table_property
(
    import_id     bigint       not null comment '导入ID',
    id            bigint auto_increment comment '字段ID 源库没有 auto_increment bigint'
        primary key,
    model_id      bigint       null comment '数据资产ID 源接口也没有 手动映射',
    code          varchar(255) null comment '字段序号',
    name          varchar(255) null comment '字段名称',
    type          varchar(255) null comment '属性类型',
    is_time       int          null comment '是否时间 在字段类型为Long时判断生效 1是',
    two_d_display int          null comment '是否二维展示',
    label         varchar(255) null comment '属性标签'
) COMMENT '数据资产表内字段说明 接口2子响应';

