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
[lhsamples, rhsamples, lhfilsp, rhfilsp] = getsamples(lh, rh, fs, Hd.Numerator);
[lhfreqsamples, rhfreqsamples] = getfreqSamples(lhsamples, rhsamples, fs);
[X,Y] = getXYMatrix(lhfreqsamples, rhfreqsamples);
fisher = fsFisher(X, Y);
%plotTopFeatures(fisher);
%plotGrandAverages(fisher, lhfreqsamples, rhfreqsamples);



%[pxx,f] = pwelch(lhsamples{22}(50,:,1),512,0,512,fs);
%figure;
%plot(f(5:47),10*log10(pxx(5:47)))
%[pxx1,f1] = pwelch(rhsamples{22}(50,:,1),512,0,512,fs);
%figure;
%plot(f1(5:47),10*log10(pxx1(5:47)))