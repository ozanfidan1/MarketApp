using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketApplication
{
    public class UrunIslemleri
    {
        marketEntities Entity = new marketEntities();

        public List<UrunTip> TumUrunleriGetir()
        {
            return Entity.Products.Select(p => new UrunTip()
            {
                id = p.id,
                SubcategoryID = p.SubcategoryID,
                Name = p.Name,
                Description = p.Description,
                Price = p.Price,
                Quantity = p.Quantity,
                Unit = p.Unit
            }).ToList();
        }

        public List<UrunTip> KategoriyeGoreUrunleriGetir(Guid SubcategoryID)
        {
            return Entity.Products.Where(p=>p.SubcategoryID==SubcategoryID).Select(p => new UrunTip()
            {
                id = p.id,
                SubcategoryID = p.SubcategoryID,
                Name = p.Name,
                Description = p.Description,
                Price = p.Price,
                Quantity = p.Quantity,
                Unit = p.Unit
            }).ToList();
        }

        public List<UrunTip> UrunSil(Guid id)
        {
            Products deleted = Entity.Products.Find(id);
            Entity.Products.Remove(deleted);
            Entity.SaveChanges();
            return TumUrunleriGetir();
        }
    }

    public class UrunTip
    {
        public System.Guid id { get; set; }
        public Nullable<System.Guid> SubcategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public double Quantity { get; set; }
        public string Unit { get; set; }
    }
}