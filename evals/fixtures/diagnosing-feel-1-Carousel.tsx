// src/onboarding/Carousel.tsx (Dayleaf web)
import { useRef, useState } from "react";
import { Dots } from "./Dots";

const CARDS = ["Write a line a day", "Look back on this day", "Keep it private"];

export function Carousel() {
  const track = useRef<HTMLDivElement>(null);
  const [active, setActive] = useState(0);

  function onScrollEnd() {
    const el = track.current!;
    setActive(Math.round(el.scrollLeft / el.clientWidth));
  }

  return (
    <div>
      <div
        ref={track}
        className="track"
        style={{ display: "flex", overflowX: "auto", scrollSnapType: "x mandatory" }}
        onScrollEnd={onScrollEnd}
      >
        {CARDS.map((c) => (
          <section key={c} style={{ flex: "0 0 100%", scrollSnapAlign: "center" }}>{c}</section>
        ))}
      </div>
      <Dots count={CARDS.length} active={active} />
    </div>
  );
}
