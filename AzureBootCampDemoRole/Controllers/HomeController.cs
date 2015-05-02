using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using AzureBootCampDemoRole.Helpers;
using Microsoft.WindowsAzure.Storage.Blob;

namespace AzureBootCampDemoRole.Controllers
{
    public class HomeController : Controller
    {
        //readonly field for container
        private readonly CloudBlobContainer container;


        public HomeController()
        {
            container = new AzureBlobStorageContainerHelper().GetContainer();
        }
       
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult ImageUpload()
        {
            List<string> blobs=new List<string>();
            foreach(var blob in container.ListBlobs())
            {
                blobs.Add(blob.Uri.ToString());
            }
            return View(blobs);
        }

        [HttpPost]
        public ActionResult ImageUpload(HttpPostedFileBase imageToUpload)
        {
            if (imageToUpload != null && imageToUpload.ContentLength > 0)
           {
               //Creating a unqiue name
               string blobName = string.Format("image_{0}{1}",
                    Guid.NewGuid().ToString(), Path.GetExtension(imageToUpload.FileName));

               //Creating a refereference for Block
               CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobName);

               //Uploading to block blob via file stream
               blockBlob.UploadFromStream(imageToUpload.InputStream);
           }
            return RedirectToAction("ImageUpload");
        }
    }
}