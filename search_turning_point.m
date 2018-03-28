function j = search_turning_point(a, theta_in_degrees)

theta = deg2rad(theta_in_degrees);
i = find(abs(a) > theta, 1, 'first');

% 
% i1 = find(l > 10, 1, 'first');
% 
% old = a(i1);
% s = 0;
% for i = i1+1:length(l)
%     new = a(i);
%     s = s + angdiff(new, old);
%     if abs(s) > theta
%         break
%     end
%     old = new;
% end
j = max(1, i - 1);
end