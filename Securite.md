# 🛡️ Jour 3 — Sécurisation active, journalisation et sauvegardes

## 🎯 Objectifs

- Mettre en place une politique de journalisation efficace pour tracer les événements du serveur
- Activer des mécanismes de défense contre les comportements anormaux (Fail2ban)
- Mettre en place une stratégie de sauvegarde automatisée
- Renforcer la stabilité et la robustesse du service `classcord`

---

## ✅ Étapes réalisées

### 1. 📓 Journalisation des événements

- Utilisation du module Python `logging` avec enregistrement dans `/var/log/classcord.log`
- Toutes les connexions, erreurs, messages et identifiants sont loggés
- Format utilisé :
  ```python
  logging.basicConfig(
      filename="/var/log/classcord.log",
      level=logging.INFO,
      format="[%(levelname)s] %(asctime)s - %(message)s"
  )
