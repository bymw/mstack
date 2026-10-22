// src/browse/RecipeTabs.tsx (Simmer web)
import { useEffect, useState } from "react";
import { fetchRecipes, recipeCache } from "../data/recipes";
import { Spinner, RecipeGrid, TabBar } from "../kit";

export function RecipeTabs() {
  const [tab, setTab] = useState<"saved" | "recent">("saved");
  const [recipes, setRecipes] = useState(recipeCache.get("saved") ?? []);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    fetchRecipes(tab).then((r) => {
      recipeCache.set(tab, r);
      setRecipes(r);
      setLoading(false);
    });
  }, [tab]);

  return (
    <div>
      <TabBar value={tab} onChange={setTab} />
      {loading ? <Spinner centered /> : <RecipeGrid key={tab} recipes={recipes} />}
    </div>
  );
}
