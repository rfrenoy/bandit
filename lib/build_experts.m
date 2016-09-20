function experts = build_experts(C,K)
    
    experts = zeros(C,K^C);
    for c=1:C
        n = K^C/K^(C-(c-1));
        temp = [];
        for k=1:K
            temp = [temp, ones(1,K^(C-c))*k];
        end
        experts(c,:) = repmat(temp,1,n);
    end
end