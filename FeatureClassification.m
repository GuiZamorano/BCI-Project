[s1,h1]=sload('MITrainingCorrect/ES31OS/Offline/ES31OS.20121106.141910.offline.mi.mi_rlbf.gdf');
[s2,h2]=sload('MITrainingCorrect/ES31OS/Offline/ES31OS.20121106.143215.offline.mi.mi_rlbf.gdf');
[s3,h3]=sload('MITrainingCorrect/ES31OS/Offline/ES31OS.20121106.145043.offline.mi.mi_rlbf.gdf');
[s4,h4]=sload('MITrainingCorrect/ES31OS/Offline/ES31OS.20121106.150426.offline.mi.mi_rlbf.gdf');
h = [h1; h2; h3; h4];
s_1 = struct('s',s1); s_2 = struct('s',s2);s_3 = struct('s',s3);s_4 = struct('s',s4);
s = [s_1;s_2;s_3;s_4];
fs = h1.EVENT.SampleRate;
[lh, rh, bf] = separateTYP(h, s);
Hd = fildes;
[lhsamples, rhsamples] = getsamples(lh, rh, fs, Hd.Numerator);
[lhfreqsamples, rhfreqsamples] = getfreqSamples(lhsamples, rhsamples, fs);



newlh = cell(60, 1);
for i = 1:60
    result= permute(lhfreqsamples{i},[2 1 3]);
    result=reshape(result,[64 43*16]);
    newlh{i} = result;
end
A = cell2mat(newlh);

newrh = cell(60, 1);
for i = 1:60
    result= permute(rhfreqsamples{i},[2 1 3]);
    result=reshape(result,[64 43*16]);
    newrh{i} = result;
end
A1 = cell2mat(newrh);
X = [A;A1];
Y = zeros(size(A, 2)+size(A1, 2), 1);
Y(1:size(A,2))=1;
Y(size(A,2)+1:end)=2;
out = fsFisher(X, Y);

%[pxx,f] = pwelch(lhsamples{22}(50,:,1),512,0,512,fs);
%figure;
%plot(f(5:47),10*log10(pxx(5:47)))
%[pxx1,f1] = pwelch(rhsamples{22}(50,:,1),512,0,512,fs);
%figure;
%plot(f1(5:47),10*log10(pxx1(5:47)))