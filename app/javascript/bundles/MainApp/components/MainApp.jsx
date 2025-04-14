import React, { useEffect, useState } from "react";
import * as s from "./MainApp.module.css";

const headers = {
  "Content-Type": "application/json",
};

const MainApp = () => {
  const [username, setUsername] = useState(localStorage.getItem("username"));
  const [points, setPoints] = useState(0);
  const [rewards, setRewards] = useState([]);
  const availableRewards = rewards.filter((reward) => !reward.redeemed);
  const redemptions = rewards.filter((reward) => reward.redeemed);

  useEffect(() => {
    if (username) {
      fetch(`/user/${username}`, { headers })
        .then((response) => response.json())
        .then((body) => {
          setPoints(body.points);
        });
    } else {
      fetch("/user", { method: "POST", headers })
        .then((response) => response.json())
        .then((body) => {
          setUsername(body.username);
          setPoints(body.points);
          localStorage.setItem("username", body.username);
        });
    }
  }, [JSON.stringify(redemptions)]);
  // get the updated user points after purchasing something

  useEffect(() => {
    if (username) {
      fetch(`/reward?username=${username}`, { headers })
        .then((response) => response.json())
        .then((body) => {
          setRewards(body);
        });
    }
  }, [username]);

  const redeemReward = (rewardId, rewardPrice) => {
    fetch("/redemption", {
      method: "POST",
      headers,
      body: JSON.stringify({
        reward_id: rewardId,
        client_purchase_price: rewardPrice,
        username,
      }),
    }).then((response) => {
      if (response.ok) {
        setRewards((curRewards) =>
          curRewards.map((reward) =>
            reward.id === rewardId ? { ...reward, redeemed: true } : reward
          )
        );
      } else {
        alert("could not purchase reward");
      }
    });
  };

  return (
    <div>
      <h3>
        Hello, {username}! You have {points} points
      </h3>
      <hr />
      <div>
        <div>
          <h2>Rewards</h2>
          <div className={s.cardContainer}>
            {availableRewards.map((reward) => (
              <div className={s.card}>
                <span>{reward.name}</span>
                <span>{reward.price}</span>
                <button
                  disabled={points < reward.price}
                  onClick={() => redeemReward(reward.id, reward.price)}
                >
                  Purchase
                </button>
              </div>
            ))}
          </div>
        </div>
        <div>
          <h2>Redemptions</h2>
          <div className={s.cardContainer}>
            {redemptions.map((redemption) => (
              <div className={s.card}>
                <span>{redemption.name}</span>
                <span>{redemption.price}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default MainApp;
