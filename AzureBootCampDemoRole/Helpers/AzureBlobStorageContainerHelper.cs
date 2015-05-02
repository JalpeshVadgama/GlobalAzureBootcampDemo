using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.ServiceRuntime;


namespace AzureBootCampDemoRole.Helpers
{
    public class AzureBlobStorageContainerHelper
    {
        private readonly string storageAccountConnectionString;

        public AzureBlobStorageContainerHelper()
        {
            //Intializing connectionstring from constructor
            storageAccountConnectionString = RoleEnvironment.GetConfigurationSettingValue("AzureStorageSettings");
        }
        

        public CloudBlobContainer GetContainer()
        {
            //Creating a Cloud Storage account
            CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            //Creating a Cloud Blob Client
            CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();

            //Getting Reference of Container
            CloudBlobContainer container = cloudBlobClient.GetContainerReference("images");

            //Creating container if not exists
            if(container.CreateIfNotExists())
            {
                //Setting pulbic permission to container
                var permissions = container.GetPermissions();
                permissions.PublicAccess = BlobContainerPublicAccessType.Container;
                container.SetPermissions(permissions);
            }

            return container;
        }
    }
}