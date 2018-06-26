using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace loginForm.Models
{
    public class Students
    {   [Key]
        public int studentId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public Boolean isActive { get; set; }

        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public DateTime dateOfBirth { get; set; }
        public string District { get; set; }
        public string Municipality { get; set; }
        public string Address { get; set; }

        public string Gender { get; set; }

        public string Photo { get; set; }

    }
}