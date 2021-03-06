a=imread('A_01_0.jpg');
figure,imshow(a)
detector = vision.CascadeObjectDetector;
bbox=step(detector,a);
point=bbox2points(bbox);
bbox(1,2)=bbox(1,2)+bbox(1,4)/2;
bbox(1,4)=bbox(1,4)/2;
out=imcrop(a,bbox);
detector = vision.CascadeObjectDetector('Mouth');
detector.MergeThreshold=100;
bbox=step(detector,out);
lip=imcrop(out,bbox);
figure,imshow(lip);
w=fspecial('average',4);
lip=imfilter(lip,w,'replicate');
figure,imshow(lip);
[t,sm]=graythresh(lip);
bw=im2bw(lip,t);
figure,imshow(bw)
