sysgen_startup;
warning off Simulink:SL_LoadMdlParameterizedLink;

user='chenhong'

casper_home=['/users/',user,'/workspace/casper/gbt/mlibrary_devel/gbt_hchen_lib'];
addpath([casper_home,'/xps_library']);
addpath([casper_home,'/casper_library']);
%addpath([casper_home,'/gavrt_library']);
system_dependent('RemoteCWDPolicy','reload');
system_dependent('RemotePathPolicy','reload');
load_system('casper_library');
load_system('xps_library');
%load_system('gavrt_library');

cd ~/workspace/casper

simulink
