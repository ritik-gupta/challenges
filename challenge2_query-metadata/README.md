## Challenge:

We need to write code that will query the meta data of an instance within AWS/Azure/GCP and provide a json formatted output.

### Reference:
``` https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service?tabs=windows ```

### Approach:
Every major cloud provider manages a metadata service you can use to retrieve information from the VM instance where the query was made.

In case of Microsoft azure it is ```http://169.254.169.254/metadata/instance?api-version=2021-02-01``` as of August 2022.

### I'm using shell script to perform this task.