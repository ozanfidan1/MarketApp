//------------------------------------------------------------------------------
// <auto-generated>
//    Bu kod bir şablondan oluşturuldu.
//
//    Bu dosyada el ile yapılan değişiklikler uygulamanızda beklenmedik davranışa neden olabilir.
//    Kod yeniden oluşturulursa, bu dosyada el ile yapılan değişikliklerin üzerine yazılacak.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MarketApplication
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subcategories
    {
        public Subcategories()
        {
            this.Products = new HashSet<Products>();
        }
    
        public System.Guid id { get; set; }
        public Nullable<System.Guid> CategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual Categories Categories { get; set; }
        public virtual ICollection<Products> Products { get; set; }
    }
}
