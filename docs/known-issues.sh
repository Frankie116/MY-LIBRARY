
# Terminal issue-------------------------------------------------------------------------------

Error:
SSH REMOTE HOST IDENTIFICATION HAS CHANGED:

https://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed

Solution:
ssh-keygen -R <hostID or host IP>

# Browser issue-------------------------------------------------------------------------------

Error:
'Your Connection is not private' in my wordpress website

Solution:
security certificate issue. resolve ssl problems (add cert etc)

quickfix:
right click anywhere on page and type 'thisisunsafe' (actually works)

https://stackoverflow.com/questions/36539852/your-connection-is-not-private-just-in-my-websites-privacy-error

# Cloudformation-----------------------------------------------------------------------------

Error:
- Template error: the attribute in Fn::ImportValue must not depend on any resources, imported values, or Fn::GetAZs


Solution:
- This can also be caused by having a misnamed reference to a parameter inside Fn::ImportValue. 
For example, if I have the following parameter NetworkStackName defined and it is mis-referenced in the 
Fn::ImportValue statement (as NetworkName), I will get this error. The NetworkName would need to be changed 
to match the value in Parameters to fix the error. (NetworkStackName) 

https://stackoverflow.com/questions/52240515/aws-cloudformation-function-call-fails-fnimportvalue-must-not-depend-on-any-r/55911656

# Cloudformation using nested stacks -------------------------------------------------------

Error:
- S3 error: Access Denied For more information check http://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html


Solution:
- Check the name of the TemplateURL in the calling CF template.  If the S3 filename was updated, then ensure the TemplateURL is also updated.


# Cloudformation-----------------------------------------------------------------------------

Error:
- Template format error: [/Resources/DNSRecord] resource definition is malformed


Solution:
- Indentation was wrong on resource name (needed only one tab instead of 2)

# Cloudformation-----------------------------------------------------------------------------

Error:
Unresolved resource dependencies [DNSRecord] in the Outputs block of the template


Solution:
- The parameter [DNSRecord] found in the Outputs block was previously renamed [EcsDNSRecord] 
- Update parameter & parameter group as required.

# Cloudformation when creating a stack ------------------------------------------------------

Error:
Template format error: The Value field of every Outputs member must evaluate to a String.


Solution - Change current code:
Outputs:
 Subnets:
    Description: List of Subnet IDs
    Value: !Ref Subnets
    Export:
      Name: !Sub ${AWS::StackName}-Subnets

to

Outputs:
 Subnets:
    Description: List of Subnet IDs
    Value: !Join [",", !Ref Subnets]
    Export:
      Name: !Sub ${AWS::StackName}-Subnets
    
or          ## code above & below do same thing..

Outputs:
  Subnets:
    Description: List of Subnet IDs
    Value: !Join
      - ','
      - !Ref Subnets
    Export:
      Name: !Sub ${AWS::StackName}-Subnets

    
# Cloudformation-----------------------------------------------------------------------------

Error: 
Template error: instance of Fn::GetAtt references undefined resource NestedStackRoot


Solution1:
Wrong parameter name in code below.  (NestedStackRoot is defined in parameter section as RemoteStackRoot)
!GetAtt NestedStackRoot.Cluster.Arn


Solution2:
Template error: instance of Fn::GetAtt references undefined resource RemoteStackRoot

# Cloudformation-----------------------------------------------------------------------------

Error: 
Template error: every Fn::Join object requires two parameters, (1) a string delimiter and (2) a list of strings to be joined or a function that returns a list of strings (such as Fn::GetAZs) to be joined.


Solution:
Parameter was named incorrectly '!Ref Subnets' below ishould be '!Ref EcsSubnets'.  Once renamed error was resolved.

Subnets: !Join [",", !Ref Subnets]

# Cloudformation using nested stacks -------------------------------------------------------

Error:
Parameter 'ContainerPort' must be a number.


Solution:
'!Ref' was missing when passing the parameter to the nested stack:

 NestedStackFargate:
    Type: AWS::CloudFormation::Stack
    DependsOn: [NestedStackAlb, NestedStackIamRoles, NestedStackDns]
    Properties:
      Parameters:
        Vpc: !Ref EcsVpc
        Image: !Ref EcsImage
        ServiceName: !Ref EcsServiceName
        ContainerPort: EcsContainerPort

# Cloudformation-----------------------------------------------------------------------------