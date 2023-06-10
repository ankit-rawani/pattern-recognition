function [] = ContourPlotMVN(u, s)
    x = (u(1)-1):0.01:(u(1)+1);
    y = (u(2)-1):0.01:(u(2)+1);
    [x1, x2] = meshgrid(x, y);
    
    p = mvnpdf([x1(:) x2(:)], u, s);
    p = reshape(p, length(x), length(x));
    
    
    f = figure;
    ax = axes('Parent', f);
    h = surf(x1, x2, p, 'Parent', ax);
    set(h, 'edgecolor', 'none');
    view(ax, [0, 90]);
    colormap(jet);
    colorbar;
end