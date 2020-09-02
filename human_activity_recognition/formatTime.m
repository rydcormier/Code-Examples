function str = formatTime( t )
    %FORMATTIME returns the amount of time given in seconds to hours, minutes, 
    % and seconds.

    h = floor( t / 3600 );
    t = t - ( h * 3600 );
    m = floor( t / 60 );
    t = t - ( m * 60 );
    s = floor(t);
    t = floor((t - s) * 10);
    str = sprintf('%02d:%02d:%02d.%d', h, m, s, t );
end
