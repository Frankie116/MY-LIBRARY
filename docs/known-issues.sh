SSH REMOTE HOST IDENTIFICATION HAS CHANGED:

https://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed

Solution:
ssh-keygen -R <hostID or host IP>

# -------------------------------------------------------------------------------------------

AWS HOSTED ZONE ID LIST FOUND HERE:

https://docs.aws.amazon.com/general/latest/gr/elb.html

# -------------------------------------------------------------------------------------------

'Your Connection is not private' in my wordpress website

security certificate issue. resolve ssl problems (add cert etc)

quickfix:
right click anywhere on page and type 'thisisunsafe' (actually works)

https://stackoverflow.com/questions/36539852/your-connection-is-not-private-just-in-my-websites-privacy-error

# -------------------------------------------------------------------------------------------

CloudFormation Error:
Template error: the attribute in Fn::ImportValue must not depend on any resources, imported values, or Fn::GetAZs

Solution:
This can also be caused by having a reference inside Fn::ImportValue to a parameter be misnamed. 
For example, if I have the following parameter NetworkStackName defined and I mis-reference it in the 
Fn::ImportValue statement (as NetworkName), I will get this error. I would need to change the NetworkName 
to match the value in Parameters, NetworkStackName to fix the error

https://stackoverflow.com/questions/52240515/aws-cloudformation-function-call-fails-fnimportvalue-must-not-depend-on-any-r/55911656

# -------------------------------------------------------------------------------------------
Cloudformation error when creating a stack using nested templates.

Error:
S3 error: Access Denied For more information check http://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html

Solution
Check the name of the TemplateURL in the calling CF template.  If the S3 filename was updated, then ensure the TemplateURL is also updated.


# -------------------------------------------------------------------------------------------