//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SEP6_BackEnd.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class userLogin
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public userLogin()
        {
            this.Movies = new HashSet<Movies>();
        }
    
        public int Id { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public string listOfFavorites { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Movies> Movies { get; set; }
    }
}
