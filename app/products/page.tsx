import { createClient } from "@/lib/supabase/server";

export default async function TestProductsPage() {
  const supabase = await createClient()
  
  const { data: products, error } = await supabase
    .from('products')
    .select('*')
  
  if (error) {
    return <div className="p-4 text-red-600">Error: {error.message}</div>
  }
  
  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-4">Test Products</h1>
      
      {products && products.length === 0 ? (
        <p className="text-gray-500">No products yet</p>
      ) : (
        <div className="space-y-2">
          {products?.map((product) => (
            <div key={product.id} className="border p-4 rounded">
              <h3 className="font-semibold">{product.name}</h3>
              <p className="text-sm text-gray-600">{product.description}</p>
              <p className="text-lg font-bold">${product.price}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}