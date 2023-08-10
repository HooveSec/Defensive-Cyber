### Make Bucket
aws s3 mb s3://yeetcannon
### Upload File
aws s3 cp pslist.txt s3://yeetcannon/
### List Files in Bucket
aws s3 ls s3://yeetcannon 
aws s3 ls s3://www.falsimentis.com
### Download Singular File 
aws s3 cp s3://www.falsimentis.com/company-profile.pdf .
### Download Folder
aws s3 sync s3://www.falsimentis.com/protected/ protected/
## Bucket Finder
bucket_finder.rb ~/labs/s3/bucketlist.txt | tee bucketlist1-output.txt 
bucket_finder.rb ~/labs/s3/shortlist.txt