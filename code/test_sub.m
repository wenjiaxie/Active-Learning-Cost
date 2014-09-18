 tr_set_add = [];
    
    for tmp = 1:(n/100)
        
        dv2 = abs(dv);

        [i,j] = find(dv2 == min(dv2));
        
        tr_add = ts_total(i,:); 
        
        tr_set_add = [tr_set_add;tr_add];% to be added to trainning set
        
        ts_total(i,:) = [];% delete from test set
    end
    
    tr_data_add = tr_set_add(:,1:10);
    
    tr_label_add = tr_set_add(:,11);
    
    data_tr = [data_tr;tr_data_add];
 
    label_tr = [label_tr;tr_label_add];