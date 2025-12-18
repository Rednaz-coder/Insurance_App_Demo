import { createClient } from "@/lib/supabase/server";
import { Suspense } from "react";

async function ProductsData() {
  const supabase = await createClient();
  
  const { data: products, error } = await supabase
    .from("products")
    .select(`
      *,
      category:categories(name)
    `);

  if (error) {
    return <div className="p-4 text-red-600">Error: {error.message}</div>;
  }

  if (!products || products.length === 0) {
    return <p className="text-gray-500 p-4">No products yet</p>;
  }

  return (
    <div className="space-y-4 p-4">
      {products.map((product) => (
        <div key={product.id} className="border p-4 rounded">
          <div className="flex justify-between">
            <div>
              <h3 className="font-semibold">{product.name}</h3>
              <p className="text-sm text-gray-600">{product.description}</p>
            </div>
            {product.category && (
              <span className="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded h-fit">
                {product.category.name}
              </span>
            )}
          </div>
          <p className="text-lg font-bold mt-2">${product.price}</p>
        </div>
      ))}
    </div>
  );
}

export default function Products() {
  return (
    <Suspense fallback={<div>Loading products...</div>}>
      <ProductsData />
    </Suspense> 
  );
}