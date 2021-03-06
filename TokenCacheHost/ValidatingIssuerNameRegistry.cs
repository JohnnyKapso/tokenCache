﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace iBankTokenAPIHost
{
    public class ValidatingIssuerNameRegistry : System.IdentityModel.Tokens.ValidatingIssuerNameRegistry
    {
        protected override System.IdentityModel.Tokens.IssuingAuthority CreateIssuingAuthority(string name)
        {
            return base.CreateIssuingAuthority(name);
        }
        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
        public override string GetIssuerName(System.IdentityModel.Tokens.SecurityToken securityToken)
        {
            return base.GetIssuerName(securityToken);
        }
        public override string GetIssuerName(System.IdentityModel.Tokens.SecurityToken securityToken, string requestedIssuerName)
        {
            return base.GetIssuerName(securityToken, requestedIssuerName);
        }
        public override string GetWindowsIssuerName()
        {
            return base.GetWindowsIssuerName();
        }
        protected override bool IsSymmetricKeyValid(string base64EncodedKey, string issuer)
        {
            return base.IsSymmetricKeyValid(base64EncodedKey, issuer);
        }
        protected override bool IsThumbprintValid(string thumbprint, string issuer)
        {
            return base.IsThumbprintValid(thumbprint, issuer);
        }
        protected override System.IdentityModel.Tokens.IssuingAuthority LoadAuthority(System.Xml.XmlElement xmlElement)
        {
            return base.LoadAuthority(xmlElement);
        }
        public override void LoadCustomConfiguration(System.Xml.XmlNodeList nodelist)
        {
            base.LoadCustomConfiguration(nodelist);
        }
        public override string ToString()
        {
            return base.ToString();
        }
    }
}