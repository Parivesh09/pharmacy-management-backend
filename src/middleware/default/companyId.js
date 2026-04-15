const companyContext = (req, res, next) => {
  const companyId = req.headers["x-company-id"] || req.body?.companyId || req.query?.companyId || req.user?.userCompanyId;

  if (companyId) {
    req.companyId = companyId;
  }
  next();
}

module.exports = companyContext;
