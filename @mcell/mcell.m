%% 单个元胞节点属性定义
classdef mcell < handle
    properties
        state;%0表示已燃完；1表示正在燃；2表示还没有开始
        time;%其实是还剩多少时间 小于0表示可以结束了（game over）
        Qpre;%其实是还差多少能量 小于0表示可以燃了
        Qall;%其实是还剩下多少能量 小于0表示可以熄火了
    end
    methods
        %定义obj=mcell([time,Qpre,Qall],state)
        function this=mcell(varargin)
            nargin
            narginchk(1,2);
            this.time=varargin{1}(1);
            this.Qpre=varargin{1}(2);
            this.Qall=varargin{1}(3);
            this.state=varargin{2};
        end
        function set.state(this,index)
            this.state=index;
        end
    end
end

