%% Build Robot
% PUMA 6R
clear all; close all; clc;
dhparams = [0   	0	1   	0;
            1	-pi/2       0       0;
            0.0203	pi/2	0	0;
            1   	pi/2	0.4318	-pi/2;
            1       -pi/2	0   	-pi/3;
            1       0       0       -pi/2];
        
robot = rigidBodyTree;

bodies = cell(6,1);
joints = cell(6,1);
for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(robot,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(robot,bodies{i},bodies{i-1}.Name)
    end
end

showdetails(robot)
figure()
movegui('northwest');
show(robot);

%% Build Robot
% SCARA PRR
clear all; close all; clc;
dofs = 3;
dhparams = [0	0   .5   0;
            0.5 0   0	pi/6;
            0.3	0	0	-pi/3;];

robot = rigidBodyTree;

bodies = cell(dofs,1);
joints = cell(dofs,1);
for i = 1:dofs
    bodies{i} = rigidBody(['body' num2str(i)]);
    if i== 1
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    elseif i== 2
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"prismatic");
    elseif i== 3
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"prismatic");
    elseif i== 4
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"prismatic");
    else 
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"prismatic");
    end
    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(robot,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(robot,bodies{i},bodies{i-1}.Name)
    end
end
showdetails(robot)

figure()
movegui('northwest');
show(robot);

