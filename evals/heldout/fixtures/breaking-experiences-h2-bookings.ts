// Co-working space room booking: the booking endpoint (Node, Express, an SQL database via an ORM).
// The space is in one city. The server runs in UTC. Members often travel.
// The iPhone app and the web app send start and end as the time the member picked,
// formatted like "2026-11-02 09:00", without a time zone.
// The iPhone app retries this request up to 3 times if it gets no response within 5 s.

app.post('/bookings', async (req, res) => {
  const { roomId, start, end } = req.body;
  const s = new Date(start);
  const e = new Date(end);

  const clash = await db.booking.findFirst({
    where: { roomId, start: { lt: e }, end: { gt: s } },
  });
  if (clash) return res.status(409).json({ error: 'Room taken' });

  const booking = await db.booking.create({
    data: { roomId, start: s, end: e, userId: req.user.id },
  });
  res.json(booking);
});

// Table: booking(id, room_id, user_id, start timestamp, end timestamp). No constraints besides the primary key.
