%plotter
%Input x is a 13 by 1 column vector, simulating the stress level in bridge beams
function [] = plotForce (x)

	thickness = [];
	color = [];
	style = [];

	for i = 1:length(x)
	    
	    %When force is zero
	    if x(i) == 0
	        %Define thickness and style
	        thickness(i) = 1;
	        style{i} = {'--'};
	    %When force is non-zero
	    else
	        thickness(i) = abs(x(i));
	        style{i} = {'-'};
	    end
	    
	    %Set colors for each bar in an array
	    if x(i) > 0
	        %disp(x(i))
	        color{i} = {[1,0,0]};   %red, bars extended
	    else
	        %disp("negative")
	        color{i} = {[0,1,0]};   %green, bars compressed
	    end
	    
	end

	    disp(x)
	    disp(color)
	    

	%bar 1
	g = plot ([0,1],[0,1],'LineWidth',thickness(1));
	set(g, {'color'}, color{1})
	set(g, {'linestyle'}, style{1})
	hold on

	%bar 2
	g = plot ([0,1],[0,0],'LineWidth',thickness(2));
	set(g, {'color'}, color{2})
	set(g, {'linestyle'}, style{2})
	hold on

	%bar 3
	g = plot ([1,1],[0,1],'LineWidth',thickness(3));
	set(g, {'color'}, color{3})
	set(g, {'linestyle'}, style{3})
	hold on

	%4
	g = plot ([1,2],[1,1],'LineWidth',thickness(4));
	set(g, {'color'}, color{4})
	set(g, {'linestyle'}, style{4})
	hold on

	%5
	g = plot ([1,2],[1,0],'LineWidth',thickness(5));
	set(g, {'color'}, color{5})
	set(g, {'linestyle'}, style{5})
	hold on

	%6
	g = plot ([1,2],[0,0],'LineWidth',thickness(6));
	set(g, {'color'}, color{6})
	set(g, {'linestyle'}, style{6})
	hold on

	%7
	g = plot ([2,2],[1,0],'LineWidth',thickness(7));
	set(g, {'color'}, color{7})
	set(g, {'linestyle'}, style{7})
	hold on

	%8
	g = plot ([2,3],[1,1],'LineWidth',thickness(8));
	set(g, {'color'}, color{8})
	set(g, {'linestyle'}, style{7})
	hold on

	%9
	g = plot ([2,3],[0,1],'LineWidth',thickness(9));
	set(g, {'color'}, color{9})
	set(g, {'linestyle'}, style{9})
	hold on

	%10
	g = plot ([2,3],[0,0],'LineWidth',thickness(10));
	set(g, {'color'}, color{10})
	set(g, {'linestyle'}, style{10})
	hold on

	%11
	g = plot ([3,3],[1,0],'LineWidth',thickness(11));
	set(g, {'color'}, color{11})
	set(g, {'linestyle'}, style{11})
	hold on

	%12
	g = plot ([3,4],[1,0],'LineWidth',thickness(12));
	set(g, {'color'}, color{12});
	set(g, {'linestyle'}, style{12})
	hold on

	%13
	g = plot ([3,4],[0,0],'LineWidth',thickness(13));
	set(g, {'color'}, color{13})
	set(g, {'linestyle'}, style{13})

    
    
end