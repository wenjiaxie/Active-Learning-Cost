fid=fopen('outs/1out.txt','a+');

fprintf(fid,'userid\t');

fprintf(fid,'number_of_friends\t\r\n');

for i=1:19999993
    fprintf(fid,'%g\t',out(i,1));
    
    fprintf(fid,'%g\r\n',out(i,2));
    
end

fclose(fid);