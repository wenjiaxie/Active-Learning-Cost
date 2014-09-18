load('data.mat')

dataset = zeros(10000,11,99);

for i=1:99
    
    filename = ['stream/trunk',num2str(i)];
    
    t_tmp = data(1+(i-1)*10000:i*10000,:);
  
    
    
        count = 1;
        
        t_add = [];
        
        t= [];
    
    for j =1:max(size(t_tmp))
        
        tmpN = t_tmp(j,11);
        
        t_add = t_tmp(j,:);
        
        if(tmpN==0)
            
            if(count == 5)
                
                count = 1;
                
                t = [t;t_add];
                
            else
                
                count = count+1;
       
            end
        else
            
            t = [t;t_add];
            
        end
        
    end
    

    
    save(filename,'t');
    
end