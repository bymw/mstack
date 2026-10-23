// Photo journal web app: the gallery for one journal.
// Journals can hold up to 2,000 photos. All of them are passed in at once.
// photo.originalUrl points to the uploaded original (often 4000 x 3000 JPEG, 3 to 6 MB).

import { useEffect, useState } from 'react';
import './Gallery.css';

export function Gallery({ photos }) {
  const [scrollY, setScrollY] = useState(0);

  useEffect(() => {
    const onScroll = () => {
      setScrollY(window.scrollY);
      // gentle parallax on every tile
      document.querySelectorAll('.tile').forEach((el) => {
        const top = el.getBoundingClientRect().top;
        el.style.transform = `translateY(${(top - window.innerHeight) * 0.05}px)`;
      });
    };
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  return (
    <div className="grid">
      {photos.map((p) => (
        <div
          className="tile"
          key={p.id}
          style={{ boxShadow: scrollY > 0 ? '0 8px 24px rgba(0,0,0,.25)' : 'none' }}
        >
          <img src={p.originalUrl} alt="" />
          <span className="caption">{new Date(p.takenAt).toLocaleString()}</span>
        </div>
      ))}
    </div>
  );
}

/* Gallery.css
.grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(160px, 1fr)); gap: 8px; }
.tile { position: relative; border-radius: 12px; overflow: hidden;
        transition: box-shadow .3s, transform .3s; filter: saturate(1.1); }
.tile img { width: 100%; display: block; }
.caption { position: absolute; bottom: 6px; left: 8px; color: #fff; font-size: 12px; }
*/
